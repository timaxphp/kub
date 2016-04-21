# coding=utf-8
from easy_thumbnails.fields import ThumbnailerImageField

from ckeditor.fields import RichTextField
from django.utils.translation import ugettext_lazy as _

from django.db import models

TYPE = (
    ('russian_bowl', _(u"Кубок России")),
    ('region_bowl', _(u"Региональные Кубки")),
    ('online_qualifying', _(u"Онлайн Отборочные")),
)


class City(models.Model):
    name = models.CharField(max_length=200, verbose_name=_(u"Название"), unique=True)
    short_name = models.CharField(max_length=5, verbose_name=_(u"Короткое Имя"), unique=True)
    about = RichTextField(null=True, blank=True, verbose_name=_(u"Информация о Городе"))
    css = RichTextField(null=True, blank=True, verbose_name=_(u"CSS"))
    image = ThumbnailerImageField(blank=True, verbose_name=_(u"Главное Изображение Города"))

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = _(u"Город")
        verbose_name_plural = _(u"Города")


class Rules(models.Model):
    city = models.OneToOneField(City, verbose_name=_(u"Город"), blank=True, null=True)
    regulations = RichTextField(null=True, blank=True, verbose_name=_(u"Регламент"))
    states = RichTextField(null=True, blank=True, verbose_name=_(u"Положение"))
    technical_rules = RichTextField(null=True, blank=True, verbose_name=_(u"Технические Правила"))

    def __unicode__(self):
        if self.city is not None:
            return unicode(_(u"Правила ") + self.city.name)
        return unicode(_(u"Главные Правила"))

    class Meta:
        verbose_name = _(u"Правила")
        verbose_name_plural = _(u"Правила")


class Tournament(models.Model):
    city = models.ForeignKey(City, verbose_name=_(u"Город"), blank=True, null=True)
    type = models.CharField(max_length=100, choices=TYPE, verbose_name=_(u"Тип Статьи"), blank=True, null=True)
    name = models.CharField(max_length=100, verbose_name=_(u"Название"))
    game_name = models.CharField(max_length=100, verbose_name=_(u"Название Игры"), blank=True, null=True)
    url = models.CharField(max_length=500, verbose_name=_(u"URL"), blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)

    def __unicode__(self):
        return unicode(self.name)

    class Meta:
        verbose_name = _(u"Турниры")
        verbose_name_plural = _(u"Турнир")
