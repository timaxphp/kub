# coding=utf-8
from __future__ import unicode_literals

from django.contrib.auth.models import User
from easy_thumbnails.fields import ThumbnailerImageField
from tourney.models import City
from ckeditor.fields import RichTextField
from django.utils.translation import ugettext_lazy as _

from django.db import models

TYPE = (
    ('video', _(u"Видео")),
    ('photo', _(u"Фото"))
)


class Media(models.Model):
    title = models.CharField(max_length=500, verbose_name=_(u"Заголовок"))
    thumb_image = ThumbnailerImageField(verbose_name=_(u"Превью"))
    html = RichTextField(blank=True, null=True, verbose_name=_(u"HTML"))
    author = models.ForeignKey(User, blank=True, null=True, verbose_name=_(u"Автор"))
    created_at = models.DateField(auto_now_add=True, verbose_name=_(u"Создано"))
    type = models.CharField(max_length=100, choices=TYPE, verbose_name=_("Тип Медиа"))
    city = models.ForeignKey(City, blank=True, null=True, verbose_name=_(u"Город"))

    @staticmethod
    def get_media():
        return Media.objects.filter(city=None).order_by('-pk')

    class Meta:
        verbose_name = _("Медиа")
        verbose_name_plural = _("Медиа")
