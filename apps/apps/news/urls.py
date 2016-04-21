from .views import *
from django.conf.urls import patterns, url

urlpatterns = [
    url(r'^detail/(?P<id>\d+)/', NewsDetailView.as_view(), name='news_detail'),
]