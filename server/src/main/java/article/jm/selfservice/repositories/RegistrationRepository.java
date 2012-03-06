package article.jm.selfservice.repositories;

import article.jm.selfservice.domain.Registration;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Registration.class)
public interface RegistrationRepository {
}
