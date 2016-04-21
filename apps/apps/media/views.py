# -*- coding: utf-8 -*-
from .models import *

from django.views.generic import ListView
from django.views.generic.base import TemplateView


class AbstractMediaView(TemplateView):
    def get_context_data(self, **kwargs):
        context = super(AbstractMediaView, self).get_context_data(**kwargs)
        context["nav_mediacontent"] = True
        return context


class MediaView(AbstractMediaView):
    template_name = "media/media.html"

    def get_context_data(self, **kwargs):
        context = super(MediaView, self).get_context_data(**kwargs)
        context["photos"] = Media.objects.filter(type="photo", city=None).order_by('-pk')[:4]
        context["videos"] = Media.objects.filter(type="video", city=None).order_by('-pk')[:4]
        return context


class MediaVideoListView(ListView):
    template_name = "media/list-video.html"
    model = Media
    context_object_name = "videos"

    def get_queryset(self):
        return Media.objects.filter(type="video", city=None).order_by('-pk')

    def get_context_data(self, **kwargs):
        context = super(MediaVideoListView, self).get_context_data(**kwargs)
        context["nav_media"] = True
        return context


class MediaPhotoListView(ListView):
    template_name = "media/list-photo.html"
    model = Media
    context_object_name = "photos"

    def get_queryset(self):
        return Media.objects.filter(type="photo", city=None).order_by('-pk')

    def get_context_data(self, **kwargs):
        context = super(MediaPhotoListView, self).get_context_data(**kwargs)
        context["nav_mediacontent"] = True
        return context


class MediaDetailView(AbstractMediaView):
    template_name = "media/detail.html"

    def get_context_data(self, **kwargs):
        context = super(MediaDetailView, self).get_context_data(**kwargs)
        media = Media.objects.get(id=kwargs['id'])
        next_array = Media.objects.filter(pk__gt=media.pk, type=media.type).order_by('pk')
        prev_array = Media.objects.filter(pk__lt=media.pk, type=media.type).order_by('-pk')
        context["media"] = media
        context["next_pk"] = next_array[0].pk if len(next_array) > 0 else -1
        context["prev_pk"] = prev_array[0].pk if len(prev_array) > 0 else -1

        return context
