/*
 * JBoss, Home of Professional Open Source
 * Copyright 2011, Red Hat, Inc., and individual contributors
 * by the @authors tag. See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package de.jax.server.rest;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import de.jax.server.model.Registration;

/**
 * @author <a href="mailto:lincolnbaxter@gmail.com">Lincoln Baxter, III</a>
 * 
 *         JAX-RS Example This class produces a RESTful service to read the contents of the table.
 */
@Stateless
@Path("/registration")
public class RegistrationEndpoint

{
   @PersistenceContext
   private EntityManager em;

   @POST
   @Consumes("application/json")
   public Registration create(Registration entity)
   {
      em.persist(entity);
      return entity;
   }

   @DELETE
   @Path("/{id}")
   @Produces("application/json")
   public Registration deleteById(@PathParam("id") String id)
   {
      Registration result = em.find(Registration.class, id);
      em.remove(result);
      return result;
   }

   @GET
   @Path("/{id}")
   @Produces("application/json")
   public Registration findById(@PathParam("id") String id)
   {
      return em.find(Registration.class, id);
   }

   @GET
   @Produces("application/json")
   public List<Registration> listAll()
   {
      @SuppressWarnings("unchecked")
      final List<Registration> results = em.createQuery("SELECT x FROM Registration x").getResultList();
      return results;
   }

   @PUT
   @Path("/{id}")
   @Consumes("application/json")
   public Registration update(@PathParam("id") String username, Registration entity)
   {
      entity.setUsername(username);
      entity = em.merge(entity);
      return entity;
   }
}