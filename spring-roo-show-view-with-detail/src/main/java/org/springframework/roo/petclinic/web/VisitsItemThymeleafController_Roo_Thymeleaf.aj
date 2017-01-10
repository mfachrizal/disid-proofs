// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.web;

import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Locale;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Visit;
import org.springframework.roo.petclinic.service.api.VisitService;
import org.springframework.roo.petclinic.web.VisitsItemThymeleafController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect VisitsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: VisitsItemThymeleafController: @Controller;
    
    declare @type: VisitsItemThymeleafController: @RequestMapping(value = "/visits/{visit}", name = "VisitsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public MessageSource VisitsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private MethodLinkBuilderFactory<VisitsItemThymeleafController> VisitsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param visitService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public VisitsItemThymeleafController.new(VisitService visitService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        this.visitService = visitService;
        this.messageSource = messageSource;
        this.itemLink = linkBuilder.of(VisitsItemThymeleafController.class);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @return Visit
     */
    @ModelAttribute
    public Visit VisitsItemThymeleafController.getVisit(@PathVariable("visit") Long id, Locale locale) {
        Visit visit = visitService.findOne(id);
        if (visit == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Visit", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return visit;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView VisitsItemThymeleafController.show(@ModelAttribute Visit visit, Model model) {
        return new ModelAndView("visits/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("visit")
    public void VisitsItemThymeleafController.initVisitBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VisitsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("visitDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VisitsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView VisitsItemThymeleafController.editForm(@ModelAttribute Visit visit, Model model) {
        populateForm(model);
        
        return new ModelAndView("visits/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView VisitsItemThymeleafController.update(@Valid @ModelAttribute Visit visit, BindingResult result, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("visits/edit");
        }
        Visit savedVisit = visitService.save(visit);
        UriComponents showURI = itemLink.to("show").with("visit", savedVisit.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> VisitsItemThymeleafController.delete(@ModelAttribute Visit visit) {
        visitService.delete(visit);
        return ResponseEntity.ok().build();
    }
    
}
