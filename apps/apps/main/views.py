from tourney.models import Rules

from django.views.generic import TemplateView


class RulesView(TemplateView):
    template_name = "main/rules.html"

    def get_context_data(self, **kwargs):
        context = super(RulesView, self).get_context_data(**kwargs)
        try:
            rules = Rules.objects.get(city=None)

            context["rules"] = True
            context["regulations"] = rules.regulations
            context["states"] = rules.states
            context["tech_rules"] = rules.technical_rules
        except Rules.DoesNotExist:
            context["rules"] = False
        context["nav_rules"] = True

        return context

    
