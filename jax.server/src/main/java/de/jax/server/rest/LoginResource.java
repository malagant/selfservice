package de.jax.server.rest;

import java.util.UUID;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import de.jax.server.model.Registration;


@Stateless
@Path("/logins")
public class LoginResource {
	
	@PersistenceContext
	private EntityManager em;

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	public Response login(Login login) {
		Registration reg = em.find(Registration.class, login.getUsername());
		if (reg != null && reg.getPassword().equals(login.getPassword())) {
			return Response.ok(new LoginStatus( UUID.randomUUID().toString())).build();
		}
		return Response.status(Status.BAD_REQUEST).build();
	}

}
