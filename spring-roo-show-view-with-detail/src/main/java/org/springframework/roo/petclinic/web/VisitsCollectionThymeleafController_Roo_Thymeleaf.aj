// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.web;

import ar.com.fdvs.dj.core.DynamicJasperHelper;
import ar.com.fdvs.dj.core.layout.ClassicLayoutManager;
import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.FastReportBuilder;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.web.datatables.Datatables;
import io.springlets.data.web.datatables.DatatablesData;
import io.springlets.data.web.datatables.DatatablesPageable;
import io.springlets.data.web.select2.Select2Data;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Visit;
import org.springframework.roo.petclinic.service.api.VisitService;
import org.springframework.roo.petclinic.web.VisitsCollectionThymeleafController;
import org.springframework.roo.petclinic.web.VisitsItemThymeleafController;
import org.springframework.roo.petclinic.web.reports.ExportingErrorException;
import org.springframework.roo.petclinic.web.reports.JasperReportsCsvExporter;
import org.springframework.roo.petclinic.web.reports.JasperReportsExporter;
import org.springframework.roo.petclinic.web.reports.JasperReportsPdfExporter;
import org.springframework.roo.petclinic.web.reports.JasperReportsXlsExporter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect VisitsCollectionThymeleafController_Roo_Thymeleaf {
    
    declare @type: VisitsCollectionThymeleafController: @Controller;
    
    declare @type: VisitsCollectionThymeleafController: @RequestMapping(value = "/visits", name = "VisitsCollectionThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    public MessageSource VisitsCollectionThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private MethodLinkBuilderFactory<VisitsItemThymeleafController> VisitsCollectionThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param visitService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public VisitsCollectionThymeleafController.new(VisitService visitService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        this.visitService = visitService;
        this.messageSource = messageSource;
        this.itemLink = linkBuilder.of(VisitsItemThymeleafController.class);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "list")
    public ModelAndView VisitsCollectionThymeleafController.list(Model model) {
        return new ModelAndView("/visits/list");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param search
     * @param pageable
     * @param draw
     * @return ResponseEntity
     */
    @GetMapping(produces = Datatables.MEDIA_TYPE, name = "datatables", value = "/dt")
    @ResponseBody
    public ResponseEntity<DatatablesData<Visit>> VisitsCollectionThymeleafController.datatables(GlobalSearch search, DatatablesPageable pageable, @RequestParam("draw") Integer draw) {
        Page<Visit> visits = visitService.findAll(search, pageable);
        long totalVisitsCount = visits.getTotalElements();
        if (search != null && StringUtils.isNotBlank(search.getText())) {
            totalVisitsCount = visitService.count();
        }
        DatatablesData<Visit> datatablesData = new DatatablesData<Visit>(visits, totalVisitsCount, draw);
        return ResponseEntity.ok(datatablesData);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param search
     * @param pageable
     * @param locale
     * @return ResponseEntity
     */
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE, name = "select2", value = "/s2")
    @ResponseBody
    public ResponseEntity<Select2Data<Visit>> VisitsCollectionThymeleafController.select2(GlobalSearch search, Pageable pageable, Locale locale) {
        Page<Visit> visits = visitService.findAll(search, pageable);
        String idExpression = "#{id}";
        String textExpression = messageSource.getMessage("expression_visit", null, "#{toString()}", locale);
        Select2Data<Visit> select2Data = new Select2Data<Visit>(visits, idExpression, textExpression);
        return ResponseEntity.ok(select2Data);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("visit")
    public void VisitsCollectionThymeleafController.initVisitBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VisitsCollectionThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("visitDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void VisitsCollectionThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PostMapping(name = "create")
    public ModelAndView VisitsCollectionThymeleafController.create(@Valid @ModelAttribute Visit visit, BindingResult result, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("/visits/create");
        }
        Visit newVisit = visitService.save(visit);
        UriComponents showURI = itemLink.to("show").with("visit", newVisit.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/create-form", name = "createForm")
    public ModelAndView VisitsCollectionThymeleafController.createForm(Model model) {
        populateForm(model);
        
        model.addAttribute(new Visit());
        return new ModelAndView("visits/create");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return ResponseEntity
     */
    @DeleteMapping(value = "/batch/{ids}", name = "deleteBatch")
    @ResponseBody
    public ResponseEntity<?> VisitsCollectionThymeleafController.deleteBatch(@PathVariable("ids") Collection<Long> ids) {
        
        visitService.delete(ids);
        
        return ResponseEntity.ok().build();
    }
    
    /**
     * Method that obtains the filtered and ordered records using the Datatables information and 
     * export them to a new report file. (It ignores the current pagination).
     *  
     * To generate the report file it uses the `DynamicJasper` library
     * (http://dynamicjasper.com). This library allows developers to generate reports dynamically
     * without use an specific template to each entity.
     *  
     * To customize the appearance of ALL generated reports, you could customize the 
     * "export_default.jrxml" template located in "src/main/resources/templates/reports/". However,
     * if you want to customize the appearance of this specific report, you could create a new
     * ".jrxml" file and provide it to the library replacing the `builder.setTemplateFile();`
     * operation used in this implementation.
     *  
     * @param search GlobalSearch that contains the filter provided by the Datatables component
     * @param pageable Pageable that contains the Sort info provided by the Datatabes component
     * @param datatablesColumns Columns displayed in the Datatables component
     * @param response The HttpServletResponse
     * @param exporter An specific JasperReportsExporter to be used during export process.
     * @param fileName The final filename to use
     */
    public void VisitsCollectionThymeleafController.export(GlobalSearch search, @PageableDefault(size = 2147483647) Pageable pageable, String[] datatablesColumns, HttpServletResponse response, JasperReportsExporter exporter, String fileName, Locale locale) {
        // Obtain the filtered and ordered elements
        Page<Visit> visits = visitService.findAll(search, pageable);
        
        // Prevent generation of reports with empty data
        if (visits == null || visits.getContent().isEmpty()) {
            return;
        }
        
        // Creates a new ReportBuilder using DynamicJasper library
        FastReportBuilder builder = new FastReportBuilder();
        
        // IMPORTANT: By default, this application uses "export_default.jrxml"
        // to generate all reports. If you want to customize this specific report,
        // create a new ".jrxml" template and customize it. (Take in account the 
        // DynamicJasper restrictions: 
        // http://dynamicjasper.com/2010/10/06/how-to-use-custom-jrxml-templates/)
        builder.setTemplateFile("templates/reports/export_default.jrxml");
        
        // The generated report will display the same columns as the Datatables component.
        // However, this is not mandatory. You could edit this code if you want to ignore
        // the provided datatablesColumns
        if (datatablesColumns != null) {
            for (String column : datatablesColumns) {
                // Delegates in addColumnToReportBuilder to include each datatables column
                // to the report builder
                addColumnToReportBuilder(column, builder, locale, fileName);
            }
        }
        
        // This property resizes the columns to use full width page.
        // Set false value if you want to use the specific width of each column.
        builder.setUseFullPageWidth(true);
        
        // Creates a new Jasper Reports Datasource using the obtained elements
        JRDataSource ds = new JRBeanCollectionDataSource(visits.getContent());
        
        // Generates the JasperReport
        JasperPrint jp;
        try {
            jp = DynamicJasperHelper.generateJasperPrint(builder.build(), new ClassicLayoutManager(), ds);
        }
        catch (JRException e) {
            String errorMessage = this.messageSource.getMessage("error_exportingErrorException", 
                new Object[] {StringUtils.substringAfterLast(fileName, ".").toUpperCase()}, 
                String.format("Error while exporting data to StringUtils file", StringUtils.
                    substringAfterLast(fileName, ".").toUpperCase()), locale);
            throw new ExportingErrorException(errorMessage);
        }
        
        // Converts the JaspertReport element to a ByteArrayOutputStream and
        // write it into the response stream using the provided JasperReportExporter
        try {
            exporter.export(jp, fileName, response);
        }
        catch (JRException e) {
            String errorMessage = this.messageSource.getMessage("error_exportingErrorException", 
                new Object[] {StringUtils.substringAfterLast(fileName, ".").toUpperCase()}, 
                String.format("Error while exporting data to StringUtils file", StringUtils.
                    substringAfterLast(fileName, ".").toUpperCase()), locale);
            throw new ExportingErrorException(errorMessage);
        }
        catch (IOException e) {
            String errorMessage = this.messageSource.getMessage("error_exportingErrorException", 
                new Object[] {StringUtils.substringAfterLast(fileName, ".").toUpperCase()}, 
                String.format("Error while exporting data to StringUtils file", StringUtils.
                    substringAfterLast(fileName, ".").toUpperCase()), locale);
            throw new ExportingErrorException(errorMessage);
        }
    }
    
    /**
     * It delegates in the `export` method providing the necessary information
     * to generate a CSV report.
     *  
     * @param search The GlobalSearch that contains the filter provided by the Datatables component
     * @param pageable The Pageable that contains the Sort info provided by the Datatabes component
     * @param datatablesColumns The Columns displayed in the Datatables component
     * @param response The HttpServletResponse
     * @return ResponseEntity
     */
    @GetMapping(name = "exportCsv", value = "/export/csv")
    @ResponseBody
    public ResponseEntity<?> VisitsCollectionThymeleafController.exportCsv(GlobalSearch search, @PageableDefault(size = 2147483647) Pageable pageable, @RequestParam("datatablesColumns") String[] datatablesColumns, HttpServletResponse response, Locale locale) {
        export(search, pageable, datatablesColumns, response, new JasperReportsCsvExporter(), "visits_report.csv", locale);
        return ResponseEntity.ok().build();
    }
    
    /**
     * It delegates in the `export` method providing the necessary information
     * to generate a PDF report.
     *  
     * @param search The GlobalSearch that contains the filter provided by the Datatables component
     * @param pageable The Pageable that contains the Sort info provided by the Datatabes component
     * @param datatablesColumns The Columns displayed in the Datatables component
     * @param response The HttpServletResponse
     * @return ResponseEntity
     */
    @GetMapping(name = "exportPdf", value = "/export/pdf")
    @ResponseBody
    public ResponseEntity<?> VisitsCollectionThymeleafController.exportPdf(GlobalSearch search, @PageableDefault(size = 2147483647) Pageable pageable, @RequestParam("datatablesColumns") String[] datatablesColumns, HttpServletResponse response, Locale locale) {
        export(search, pageable, datatablesColumns, response, new JasperReportsPdfExporter(), "visits_report.pdf", locale);
        return ResponseEntity.ok().build();
    }
    
    /**
     * It delegates in the `export` method providing the necessary information
     * to generate a XLS report.
     *  
     * @param search The GlobalSearch that contains the filter provided by the Datatables component
     * @param pageable The Pageable that contains the Sort info provided by the Datatabes component
     * @param datatablesColumns The Columns displayed in the Datatables component
     * @param response The HttpServletResponse
     * @return ResponseEntity
     */
    @GetMapping(name = "exportXls", value = "/export/xls")
    @ResponseBody
    public ResponseEntity<?> VisitsCollectionThymeleafController.exportXls(GlobalSearch search, @PageableDefault(size = 2147483647) Pageable pageable, @RequestParam("datatablesColumns") String[] datatablesColumns, HttpServletResponse response, Locale locale) {
        export(search, pageable, datatablesColumns, response, new JasperReportsXlsExporter(), "visits_report.xls", locale);
        return ResponseEntity.ok().build();
    }
    
    /**
     * This method contains all the entity fields that are able to be displayed in a 
     * report. The developer could add a new column to the report builder providing the 
     * field name and the builder where the new field will be added as column.
     *  
     * @param columnName The field name to show as column
     * @param builder The builder where the new field will be added as column.
     */
    public void VisitsCollectionThymeleafController.addColumnToReportBuilder(String columnName, FastReportBuilder builder, Locale locale, String fileName) {
        try {
        if (columnName.equals("id")) {
            builder.addColumn(this.messageSource.getMessage("label_visit_id", null, "Id", locale), "id", Long.class.getName(), 50);
        }
        else if (columnName.equals("version")) {
            builder.addColumn(this.messageSource.getMessage("label_visit_version", null, "Version", locale), "version", Integer.class.getName(), 100);
        }
        else if (columnName.equals("description")) {
            builder.addColumn(this.messageSource.getMessage("label_visit_description", null, "Description", locale), "description", String.class.getName(), 100);
        }
        else if (columnName.equals("visitDate")) {
            builder.addColumn(this.messageSource.getMessage("label_visit_visitdate", null, "Visit Ate", locale), "visitDate", Date.class.getName(), 100);
        }
        }
        catch (ColumnBuilderException e) {
            String errorMessage = this.messageSource.getMessage("error_exportingErrorException", 
                new Object[] {StringUtils.substringAfterLast(fileName, ".").toUpperCase()}, 
                String.format("Error while exporting data to StringUtils file", StringUtils.
                    substringAfterLast(fileName, ".").toUpperCase()), locale);
            throw new ExportingErrorException(errorMessage);
        }
        catch (ClassNotFoundException e) {
            String errorMessage = this.messageSource.getMessage("error_exportingErrorException", 
                new Object[] {StringUtils.substringAfterLast(fileName, ".").toUpperCase()}, 
                String.format("Error while exporting data to StringUtils file", StringUtils.
                    substringAfterLast(fileName, ".").toUpperCase()), locale);
            throw new ExportingErrorException(errorMessage);
        }
    }
    
}