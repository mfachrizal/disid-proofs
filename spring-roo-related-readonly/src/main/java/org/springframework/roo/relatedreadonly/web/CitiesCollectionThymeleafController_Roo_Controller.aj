// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.relatedreadonly.web;

import org.springframework.roo.relatedreadonly.service.api.CityService;
import org.springframework.roo.relatedreadonly.web.CitiesCollectionThymeleafController;

privileged aspect CitiesCollectionThymeleafController_Roo_Controller {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private CityService CitiesCollectionThymeleafController.cityService;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return CityService
     */
    public CityService CitiesCollectionThymeleafController.getCityService() {
        return cityService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cityService
     */
    public void CitiesCollectionThymeleafController.setCityService(CityService cityService) {
        this.cityService = cityService;
    }
    
}
