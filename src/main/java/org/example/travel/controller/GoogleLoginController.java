package org.example.travel.controller;

import com.google.api.client.auth.oauth2.AuthorizationCodeRequestUrl;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.*;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.client.util.store.MemoryDataStoreFactory;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfo;
import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.User;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class GoogleLoginController {

    @Autowired
    private UserService userService;

    @Value("${google.client-id}")
    private String clientId;

    @Value("${google.client-secret}")
    private String clientSecret;

    @Value("${google.redirect-uri}")
    private String redirectUri;

    @Value("${google.scope}")
    private String scope;

    private GoogleAuthorizationCodeFlow flow;

    @GetMapping("/google-login")
    public String googleLogin() throws IOException {
        flow = new GoogleAuthorizationCodeFlow.Builder(
                new NetHttpTransport(), new JacksonFactory(),
                clientId, clientSecret, Collections.singletonList(scope))
                .setDataStoreFactory(new FileDataStoreFactory(new java.io.File("tokens")))
                .setAccessType("offline")
                .build();

        AuthorizationCodeRequestUrl authorizationUrl = flow.newAuthorizationUrl().setRedirectUri(redirectUri);
        return "redirect:" + authorizationUrl.build();
    }

    @GetMapping("/callbackGoogle")
    public String callback(@RequestParam String code, HttpSession session) throws IOException {
        if (code != null) {
            try {
                GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                        GoogleNetHttpTransport.newTrustedTransport(),
                        JacksonFactory.getDefaultInstance(),
                        clientId,
                        clientSecret,
                        Collections.singleton(scope))
                        .setDataStoreFactory(new MemoryDataStoreFactory())
                        .setAccessType("offline")
                        .build();

                GoogleTokenResponse tokenResponse = flow.newTokenRequest(code).setRedirectUri(redirectUri).execute();
                String userId = "defaultUser";
                Credential credential = flow.createAndStoreCredential(tokenResponse, userId);

                Oauth2 oauth2 = new Oauth2.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential)
                        .setApplicationName("PetShop")
                        .build();

                Userinfo userInfo = oauth2.userinfo().get().execute();
                String googleUserId = userInfo.getId();
                User user = userService.findByGoogleIDAndEmail(googleUserId, userInfo.getEmail());
                if (user == null) {
                    User newUser = new User();
                    newUser.setGoogleID(googleUserId);
                    newUser.setAvatar(userInfo.getPicture());
                    newUser.setFirstName(userInfo.getGivenName());
                    newUser.setLastName(userInfo.getFamilyName());
                    newUser.setEmail(userInfo.getEmail());
                    newUser.setIsActive(true);
                    userService.saveUser(newUser);
                }

                session.setAttribute("user", user);
            } catch (GeneralSecurityException e) {
                System.out.println(e);
            }
        }
        return "redirect:/";

    }


}
