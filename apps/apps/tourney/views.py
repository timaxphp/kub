# -*- coding: utf-8 -*-
from datetime import datetime

from .models import *
from news.models import Article
from media.models import Media

from django.views.generic.base import TemplateView
from django.views.generic.list import ListView
from django.http import HttpResponse
from django.core.mail import send_mail
from django.conf import settings

import decimal
import json


class TourneyView(TemplateView):
    def get_context_data(self, **kwargs):
        context = super(TourneyView, self).get_context_data(**kwargs)
        context["nav_tourney"] = True
        return context


class TourneyMapView(TourneyView):
    template_name = "tourney/map.html"

    def get_context_data(self, **kwargs):
        context = super(TourneyMapView, self).get_context_data(**kwargs)
        context["cities"] = City.objects.all()
        tournaments_array = []
        tournaments = Tournament.objects.filter(time__gt=datetime.now()).order_by('city', 'time')
        last_city = ""
        for tournament in tournaments:
            if last_city != tournament.city.short_name:
                last_city = tournament.city.short_name
                tournaments_dict = {
                    "russian_bowl": list(),
                    "region_bowl": list(),
                    "online_qualifying": list()
                }
                city_dict = {
                    "short_name": last_city,
                    "tournaments": dict(tournaments_dict)
                }
                tournaments_array.append(dict(city_dict))
            tournaments_array[-1]["tournaments"][tournament.type].append(tournament)
        context["tournaments"] = tournaments_array
        return context


class TournamentCityView(TourneyView):
    def get_context_data(self, **kwargs):
        context = super(TournamentCityView, self).get_context_data(**kwargs)
        city = City.objects.get(short_name=kwargs["city"])

        context["city"] = city
        return context


class TournamentCityNewsView(ListView):
    template_name = "tourney/city-news.html"
    paginate_by = 5
    context_object_name = "news"

    def get_queryset(self):
        city = City.objects.get(short_name=self.kwargs["city"])
        return Article.objects.filter(city=city).order_by('-pk')

    def get_context_data(self, **kwargs):
        context = super(TournamentCityNewsView, self).get_context_data(**kwargs)
        city = City.objects.get(short_name=self.kwargs["city"])

        context["city"] = city
        context["is_news"] = True
        context["nav_tourney"] = True

        return context


class TournamentCityRulesView(TournamentCityView):
    template_name = "tourney/city-rules.html"

    def get_context_data(self, **kwargs):
        context = super(TournamentCityRulesView, self).get_context_data(**kwargs)
        try:
            rules = Rules.objects.get(city=context["city"])

            context["rules"] = True
            context["regulations"] = rules.regulations
            context["states"] = rules.states
            context["tech_rules"] = rules.technical_rules
        except Rules.DoesNotExist:
            context["rules"] = False
        context["is_rules"] = True

        return context


class TournamentCityInfoView(TournamentCityView):
    template_name = "tourney/city-info.html"

    def get_context_data(self, **kwargs):
        context = super(TournamentCityInfoView, self).get_context_data(**kwargs)
        context["info"] = context["city"].about
        context["is_info"] = True
        return context


class TournamentCityMediaView(TournamentCityView):
    template_name = "tourney/media.html"

    def get_context_data(self, **kwargs):
        context = super(TournamentCityMediaView, self).get_context_data(**kwargs)
        context["photos"] = Media.objects.filter(type="photo",
                                                 city=City.objects.get(short_name=kwargs["city"])).order_by('-pk')[:4]
        context["videos"] = Media.objects.filter(type="video",
                                                 city=City.objects.get(short_name=kwargs["city"])).order_by('-pk')[:4]
        context["is_media"] = True
        return context


class TournamentCityMediaVideoListView(ListView):
    template_name = "tourney/media-list-video.html"
    model = Media
    context_object_name = "videos"

    def get_queryset(self):
        return Media.objects.filter(type="video", city=City.objects.get(short_name=self.kwargs["city"])).order_by('-pk')

    def get_context_data(self, **kwargs):
        context = super(TournamentCityMediaVideoListView, self).get_context_data(**kwargs)
        context["nav_tourney"] = True
        context["city"] = City.objects.get(short_name=self.kwargs["city"])
        context["is_media"] = True
        return context


class TournamentCityMediaPhotoListView(ListView):
    template_name = "tourney/media-list-photo.html"
    model = Media
    context_object_name = "photos"

    def get_queryset(self):
        return Media.objects.filter(type="photo", city=City.objects.get(short_name=self.kwargs["city"])).order_by('-pk')

    def get_context_data(self, **kwargs):
        context = super(TournamentCityMediaPhotoListView, self).get_context_data(**kwargs)
        context["nav_tourney"] = True
        context["city"] = City.objects.get(short_name=self.kwargs["city"])
        context["is_media"] = True
        return context


class TournamentCityMediaDetailView(TournamentCityView):
    template_name = "tourney/media-detail.html"

    def get_context_data(self, **kwargs):
        context = super(TournamentCityMediaDetailView, self).get_context_data(**kwargs)
        media = Media.objects.get(id=kwargs['id'])
        next_array = Media.objects.filter(pk__gt=media.pk, type=media.type,
                                          city=City.objects.get(short_name=kwargs["city"])).order_by('pk')
        prev_array = Media.objects.filter(pk__lt=media.pk, type=media.type,
                                          city=City.objects.get(short_name=kwargs["city"])).order_by('-pk')
        context["media"] = media
        context["next_pk"] = next_array[0].pk if len(next_array) > 0 else -1
        context["prev_pk"] = prev_array[0].pk if len(prev_array) > 0 else -1
        context["is_media"] = True

        return context


class TournamentCityTournamentsView(ListView):
    model = Tournament
    context_object_name = "tournaments"
    template_name = "tourney/tournaments-list.html"

    def get_queryset(self):
        return Tournament.objects.filter(time__gt=datetime.now(),
                                         city=City.objects.get(short_name=self.kwargs["city"])).order_by('city', 'time')

    def get_context_data(self, **kwargs):
        context = super(TournamentCityTournamentsView, self).get_context_data(**kwargs)
        context["nav_tourney"] = True
        context["city"] = City.objects.get(short_name=self.kwargs["city"])
        context["is_tournaments"] = True
        return context
