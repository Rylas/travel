package org.example.travel.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.apis.FacebookApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import org.example.travel.entity.User;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

@Controller
public class FBLoginController {

    @Autowired
    private UserService userService;
    private final String clientId = "1710158906058386";
    private final String clientSecret = "9f76f9a20e4c9bf31e455b6c5b1303f3";
    private final String redirectUri = "http://localhost:8080/callbackFacebook";
    private final String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";
    private final OAuth20Service service = new ServiceBuilder(clientId)
            .apiSecret(clientSecret)
            .callback(redirectUri)
            .build(FacebookApi.instance());
    @GetMapping("/facebook")
    public String loginWithFacebook() throws IOException {

        String authorizationUrl = service.getAuthorizationUrl();
        return "redirect:" + authorizationUrl;
    }

    @GetMapping("/callbackFacebook")
    public String facebookCallback(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session) throws IOException {
        try {
            OAuth2AccessToken accessToken = service.getAccessToken(code);
            OAuthRequest request = new OAuthRequest(Verb.GET, FACEBOOK_LINK_GET_USER_INFO);
            service.signRequest(accessToken, request);
            Response response = service.execute(request);

            String responseBody = response.getBody();
            if (responseBody.startsWith("{")) {
                ObjectMapper mapper = new ObjectMapper();
                JsonNode rootNode = mapper.readTree(responseBody);
                String userId = rootNode.path("id").asText();
                if (userId == null || userId.isEmpty()) {
                    throw new ServletException("Unable to retrieve Facebook user ID");
                }
                User user = userService.findByFacebookID(userId);
                if (user == null) {
                    String name = rootNode.path("name").asText();
                    String pictureUrl = rootNode.path("picture").path("data").path("url").asText();
                    user = new User();
                    user.setFacebookID(userId);
                    user.setFirstName(name);
                    user.setLastName("");
                    user.setEmail("");
                    user.setAvatar(pictureUrl);
                    user.setIsActive(true);
                    userService.saveUser(user);
                }

                if (user.getBan() != null) {
                    ra.addFlashAttribute("message", "Your account has been banned");
                    return "redirect:/login";
                }

                session.setAttribute("user", user);
                return "redirect:/";
            } else {
                return "redirect:/login";
            }
        } catch (InterruptedException | ExecutionException e) {
            return "redirect:/login";
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
