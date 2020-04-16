package com.example.practicadocker.Controlador;

import com.example.practicadocker.Entidad.Formulario;
import com.example.practicadocker.Repositorio.FormRepo;
import com.example.practicadocker.Servicio.FormularioServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/barcamp/")
public class UsuarioController {

    //@Autowired
    FormRepo formRepo;

    @Autowired
    private FormularioServices formServices;

    public UsuarioController(FormRepo formRepo) {
        this.formRepo = formRepo;
    }


    @RequestMapping(path = "/form")
    public String index(Model model){
        model.addAttribute("titutlo", "Formulario Barcamp");
        model.addAttribute("label", "Formulario Barcamp");
        return "formu";
    }

    @RequestMapping(path ="/saveform", method = RequestMethod.GET)
    public String guardarform (@RequestParam("pregunta1") int pregunta1,
                               @RequestParam("pregunta2") int pregunta2,
                               @RequestParam("pregunta3") int pregunta3,
                               @RequestParam("pregunta4") String pregunta4)
        {

            Formulario formulario = new Formulario();
            formulario.setPregunta1(pregunta1);
            formulario.setPregunta2(pregunta2);
            formulario.setPregunta3(pregunta3);
            formulario.setPregunta4(pregunta4);
            formRepo.save(formulario);
            return "redirect:/barcamp/form";
    }
}
