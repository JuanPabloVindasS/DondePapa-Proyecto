package com.ProyectoWebRestaurante;
//Juan Pablo Vindas //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

import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class ProjectConfig implements WebMvcConfigurer {

    @Bean
    public LocaleResolver localeResolver() {
        var slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.getDefault());
        slr.setLocaleAttributeName("session.current.locale");
        slr.setTimeZoneAttributeName("session.current.timezone");
        return slr;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        var lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registro) {
        registro.addInterceptor(localeChangeInterceptor());
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registro) {
        registro.addViewController("/").setViewName("index");
        registro.addViewController("/index").setViewName("index");
        registro.addViewController("/login").setViewName("login");
        registro.addViewController("/registro/nuevo").setViewName("registro/nuevo");
    }
    
@Bean
public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
        .authorizeHttpRequests(auth -> auth
            // Public paths
            .requestMatchers("/","/registro/nuevo","/nuevo", "/crearUsuario"," /registro/salida","/activar","/recordarUsuario","/registro/salida","/registro","/registro/nuevo","/registro/recordar","/registro/salida","/registro/activa", "/index", "/registro/crearUsuario", "/navegar/listado","/navegar/listado/**","/reservacion/guardar","/reservacion/eliminar/**","/reservacion/modificar/**", "/navegar/query1", "/plato/listado", "/ordenar", "/reservacion/listado", "/navegar/listado2", "/css/**", "/js/**", "/webjars/**", "/registro/**")
            .permitAll()

            // User-specific paths (defined to access certain functionalities)
            .requestMatchers("/navegar/listado", "/reservacion/listado", "/navegar/listado2")
            .hasRole("USER")

            // Vendor-specific paths (no access to order online, and more managerial functions)
            .requestMatchers("/plato/listado", "/categoria/listado")
            .hasRole("VENDEDOR")

            // Admin-exclusive paths (complete access to all functionalities)
            .requestMatchers("/categoria/nuevo", "/categoria/modificar/**", "/categoria/eliminar/**", "/categoria/guardar",
                             "/plato/nuevo", "/plato/modificar/**", "/plato/eliminar/**", "/plato/guardar", "/pruebas/**")
            .hasRole("ADMIN")

            // Paths requiring authentication (for shopping cart and other user-specific actions)
            .requestMatchers("/facturar/carrito")
            .authenticated()
        )
        .formLogin(form -> form
            .loginPage("/login") // Custom login page
            .defaultSuccessUrl("/index", true) // Redirect to a specific page upon successful login
            .permitAll())
        .logout(logout -> logout
            .logoutSuccessUrl("/") // Redirect to homepage on logout
            .permitAll());

    return http.build();
}

//    
//    @Bean
//    public UserDetailsService users() {
//        //Se definen 3 usurio con roles 
//        UserDetails admin = User.builder()
//                .username("juan")
//                .password("{noop}123")
//                .roles("ADMIN", "VENDEDOR", "USER")
//                .build();
//
//        UserDetails vendedor = User.builder()
//                .username("lafit")
//                .password("{noop}456")
//                .roles("VENDEDOR", "USER")
//                .build();
//
//        UserDetails cliente = User.builder()
//                .username("allan")
//                .password("{noop}789")
//                .roles("USER")
//                .build();
//
//        return new InMemoryUserDetailsManager(admin, vendedor, cliente);
//    }
//     
    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
        builder.userDetailsService(userDetailsService)
                .passwordEncoder(new BCryptPasswordEncoder());
    }

}
