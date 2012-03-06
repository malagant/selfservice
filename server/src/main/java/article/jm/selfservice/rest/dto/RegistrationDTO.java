package article.jm.selfservice.rest.dto;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * User: mjohann
 * Date: 05.03.12
 * Time: 15:52
 */
@XmlRootElement
public class RegistrationDTO {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String passwordConfirmation;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }

    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
    }
}
