// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.disid.proof.web;

import org.disid.proof.service.api.AuthorService;
import org.disid.proof.web.AuthorsItemThymeleafController;

privileged aspect AuthorsItemThymeleafController_Roo_Controller {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private AuthorService AuthorsItemThymeleafController.authorService;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return AuthorService
     */
    public AuthorService AuthorsItemThymeleafController.getAuthorService() {
        return authorService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param authorService
     */
    public void AuthorsItemThymeleafController.setAuthorService(AuthorService authorService) {
        this.authorService = authorService;
    }
    
}