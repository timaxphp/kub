from .views import *
from django.conf.urls import patterns, url

urlpatterns = [
    url(r'^$', MediaView.as_view(), name='mediacontent'),
    url(r'^videos/$', MediaVideoListView.as_view(), name='media_videos'),
    url(r'^photos/$', MediaPhotoListView.as_view(), name='media_photos'),
    url(r'^detail/(?P<id>\d+)/', MediaDetailView.as_view(), name='media_detail'),
]
