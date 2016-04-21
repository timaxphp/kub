from main.views import RulesView
from django.contrib import admin
from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib.flatpages import views
from django.views.generic.base import TemplateView

from news.views import NewsListView

urlpatterns = patterns('',
    url(r'^$', NewsListView.as_view(), name='index'),
    url(r'^rules/$', RulesView.as_view(), name='rules'),
    url(r'^tourney/', include('tourney.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^news/', include('news.urls')),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^med/', include('media.urls'))
)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += [
    url(r'^translation/$', views.flatpage, {'url': '/translation/'}, name='translation'),

]
