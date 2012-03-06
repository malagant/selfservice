package article.jm.selfservice.rest;

import article.jm.selfservice.domain.Registration;
import article.jm.selfservice.domain.RegistrationService;
import article.jm.selfservice.rest.dto.RegistrationDTO;
import article.jm.selfservice.rest.dto.RegistrationDTOList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component
@Scope("request")
@Path("/registrations")
public class RegistrationsResource {

    @Context
    private UriInfo uriInfo;

    @Autowired
    private RegistrationService registrationService;

    @POST
    @Produces({MediaType.APPLICATION_JSON})
    public Response createRegistration(RegistrationDTO registrationDTO) {
        if (registrationDTO.getPassword().equals(registrationDTO.getPasswordConfirmation())) {
            Registration registration = new Registration();
            registration.setFirstName(registrationDTO.getFirstName());
            registration.setLastName(registrationDTO.getLastName());
            registration.setEmail(registrationDTO.getEmail());
            registration.setPassword(registrationDTO.getPassword());
            registrationService.saveRegistration(registration);
            URI redirect = uriInfo.getBaseUriBuilder().path(RegistrationsResource.class).path(registration.getId() + "").build();

            return Response.created(redirect).build();
        } else {
            return Response.status(400).build();
        }
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public RegistrationDTOList index() {
        List<Registration> list = registrationService.findAllRegistrations();
        RegistrationDTOList registrationDTOList = new RegistrationDTOList();
        List<RegistrationDTO> registrations = new ArrayList<RegistrationDTO>(list.size());
        for (Iterator<Registration> iterator = list.iterator(); iterator.hasNext(); ) {
            RegistrationDTO dto = new RegistrationDTO();
            Registration registration = iterator.next();
            dto.setFirstName(registration.getFirstName());
            dto.setLastName(registration.getLastName());
            dto.setEmail(registration.getEmail());
            dto.setPassword(registration.getPassword());
            dto.setPasswordConfirmation(registration.getPassword());

            registrations.add(dto);
        }
        registrationDTOList.setRegistrations(registrations);
        return registrationDTOList;
    }
}
