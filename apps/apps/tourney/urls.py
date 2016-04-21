from .views import *
from django.conf.urls import patterns, url

urlpatterns = [
    url(r'^map/$', TourneyMapView.as_view(), name='tourney_map'),
    url(r'^(?P<city>[a-z]{0,5})/news/$', TournamentCityNewsView.as_view(), name='tournament_city_news'),
    url(r'^(?P<city>[a-z]{0,5})/rules/$', TournamentCityRulesView.as_view(), name='tournament_city_rules'),
    url(r'^(?P<city>[a-z]{0,5})/info/$', TournamentCityInfoView.as_view(), name='tournament_city_info'),
    url(r'^(?P<city>[a-z]{0,5})/tournaments/$', TournamentCityTournamentsView.as_view(),
        name='tournament_city_tournaments'),
    url(r'^(?P<city>[a-z]{0,5})/med/$', TournamentCityMediaView.as_view(), name='tournament_media'),
    url(r'^(?P<city>[a-z]{0,5})/med/videos/$', TournamentCityMediaVideoListView.as_view(),
        name='tournament_media_videos'),
    url(r'^(?P<city>[a-z]{0,5})/med/photos/$', TournamentCityMediaPhotoListView.as_view(),
        name='tournament_media_photos'),
    url(r'^(?P<city>[a-z]{0,5})/media/detail/(?P<id>\d+)/', TournamentCityMediaDetailView.as_view(),
        name='tournament_media_detail'),
]
