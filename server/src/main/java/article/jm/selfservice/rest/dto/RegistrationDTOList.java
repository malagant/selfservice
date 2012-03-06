package article.jm.selfservice.rest.dto;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * User: mjohann
 * Date: 05.03.12
 * Time: 19:38
 */
@XmlRootElement
public class RegistrationDTOList {
    private List<RegistrationDTO> registrations;

    public List<RegistrationDTO> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(List<RegistrationDTO> registrations) {
        this.registrations = registrations;
    }
}
