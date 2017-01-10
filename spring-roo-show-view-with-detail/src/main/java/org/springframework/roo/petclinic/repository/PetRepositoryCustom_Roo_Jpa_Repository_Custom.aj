// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.repository;

import io.springlets.data.domain.GlobalSearch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.petclinic.domain.Owner;
import org.springframework.roo.petclinic.domain.Pet;
import org.springframework.roo.petclinic.domain.PetNameAndWeightFormBean;
import org.springframework.roo.petclinic.repository.PetRepositoryCustom;

privileged aspect PetRepositoryCustom_Roo_Jpa_Repository_Custom {
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Pet> PetRepositoryCustom.findByOwner(Owner owner, GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Pet> PetRepositoryCustom.findAll(GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Pet> PetRepositoryCustom.findByNameAndWeight(PetNameAndWeightFormBean formBean, GlobalSearch globalSearch, Pageable pageable);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public abstract long PetRepositoryCustom.countByNameAndWeight(PetNameAndWeightFormBean formBean);
    
}
