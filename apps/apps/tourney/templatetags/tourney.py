from datetime import datetime
from django import template
from django.core.urlresolvers import resolve
from django.core.cache import cache
from django.template import Template
from django.utils import translation
from django.conf import settings
import logging

from ..models import Tournament

register = template.Library()


@register.inclusion_tag('tourney/last_tourneys.html', takes_context=True)
def tourneys_block(context, city=None):
    if city:
        return {
            'tournaments': Tournament.objects.filter(time__gt=datetime.now(), city=city).order_by('city', 'time')[:6]
        }
    return {
        'tournaments': Tournament.objects.filter(time__gt=datetime.now()).order_by('city', 'time')[:6]
    }