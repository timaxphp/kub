# -*- coding: utf-8 -*-
from tourney.models import City
from django.db import models, transaction
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from registration.models import RegistrationManager

from easy_thumbnails.fields import ThumbnailerImageField


class Profile(models.Model):
    avatar = ThumbnailerImageField(upload_to='profile', blank=True, verbose_name="Аватар")
    city = models.ForeignKey(City, verbose_name="Город", blank=True, null=True)
    name = models.CharField(verbose_name="Имя/Псевдоним", max_length=100, blank=True)
    user = models.OneToOneField(User, related_name="account_user")

    def get_absolute_url(self):
        return reverse('user_account', args=[self.id])

    def __unicode__(self):
        return self.user.username

    class Meta:
        verbose_name = 'Профиль'
        verbose_name_plural = 'Профили'


def user_registered_callback(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


post_save.connect(user_registered_callback, sender=User, dispatch_uid="create_user_profile")