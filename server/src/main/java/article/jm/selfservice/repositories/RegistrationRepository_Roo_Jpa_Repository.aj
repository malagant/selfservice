// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package article.jm.selfservice.repositories;

import article.jm.selfservice.domain.Registration;
import article.jm.selfservice.repositories.RegistrationRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect RegistrationRepository_Roo_Jpa_Repository {
    
    declare parents: RegistrationRepository extends JpaRepository<Registration, Long>;
    
    declare parents: RegistrationRepository extends JpaSpecificationExecutor<Registration>;
    
    declare @type: RegistrationRepository: @Repository;
    
}
