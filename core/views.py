from django.shortcuts import render # type: ignore
from core.custom.visitantes import Visitantes


visitantes_homepage = Visitantes()


def home(request) -> render:
    """A página inicial do projeto."""
    
    visitantes_homepage.visitas += 1
    
    return render(
        request=request, 
        template_name='index.html', 
        context={'count': visitantes_homepage.visitas}
        )
    
