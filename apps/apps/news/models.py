# coding=utf-8
from __future__ import unicode_literals

from django.contrib.auth.models import User
from easy_thumbnails.fields import ThumbnailerImageField
from tourney.models import City
from ckeditor.fields import RichTextField
from django.utils.translation import ugettext_lazy as _

from django.db import models


TYPE = (
    ('russian_bowl', _(u"Кубок России")),
    ('region_bowl', _(u"Региональные Кубки")),
    ('online_qualifying', _(u"Онлайн Отборочные")),
)


class Article(models.Model):
    title = models.CharField(max_length=500, verbose_name=_(u"Заголовок"))
    main_image = ThumbnailerImageField(blank=True, verbose_name=_("Превью Статьи"))
    short_article = RichTextField(verbose_name=_(u"Краткое Содержание"))
    article = RichTextField(verbose_name=_(u"Статья"))
    author = models.ForeignKey(User, blank=True, null=True, verbose_name=_(u"Автор"))
    created_at = models.DateField(auto_now_add=True, verbose_name=_(u"Создано"))
    type = models.CharField(max_length=100, choices=TYPE, verbose_name=_(u"Тип Статьи"))
    city = models.ForeignKey(City, blank=True, null=True, verbose_name=_(u"Город"))

    @staticmethod
    def get_news():
        return Article.objects.filter(city=None).order_by('-pk')

    class Meta:
        verbose_name = _("Новости")
        verbose_name_plural = _("Статья")
