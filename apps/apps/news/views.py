# -*- coding: utf-8 -*-
from .models import Article

from django.views.generic import ListView
from django.views.generic.base import TemplateView


class NewsView(TemplateView):
    def get_context_data(self, **kwargs):
        context = super(NewsView, self).get_context_data(**kwargs)
        context["nav_news"] = True
        return context


class NewsListView(ListView):
    template_name = "news/news.html"
    model = Article
    context_object_name = "news"
    paginate_by = 5

    def get_queryset(self):
        return Article.get_news()

    def get_context_data(self, **kwargs):
        context = super(NewsListView, self).get_context_data(**kwargs)
        context["nav_news"] = True
        return context


class NewsDetailView(NewsView):
    template_name = "news/detail.html"

    def get_context_data(self, **kwargs):
        context = super(NewsDetailView, self).get_context_data(**kwargs)
        context["article"] = Article.objects.get(id=kwargs['id'])

        return context
