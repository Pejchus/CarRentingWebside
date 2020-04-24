package tygri.pujcovna;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import tygri.pujcovna.model.AuthorityType;
import tygri.pujcovna.services.CarService;
import tygri.pujcovna.services.CarorderService;
import tygri.pujcovna.services.UserService;

@SpringBootApplication
public class Main {

    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }

    @Bean
    ApplicationRunner init(UserService userService, CarService carService, CarorderService carorderService) {
        return (ApplicationArguments args) -> dataSetup(userService, carService, carorderService);
    }

    //init db on launch, works only when db is empty
    public void dataSetup(UserService userService, CarService carService, CarorderService carorderService) {
        userService.createAuthority(AuthorityType.ROLE_ADMIN);
        userService.createAuthority(AuthorityType.ROLE_CUSTOMER);
        userService.createAuthority(AuthorityType.ROLE_EMPLOYEE);
        userService.createUser("admin", "admin", "admin@admin.com", "true", "777777777", "25101", "admin", "vonAdmin", "Praha", "Parizska", "4", "ADMIN");
        userService.createUser("zamestnanec", "zamestnanec", "zamestnanec@zamestnanec.com", "true", "666666666", "069", "zamestnanec", "vonZamestnanec", "Ricany", "Sokolska", "5", "EMPLOYEE");
        userService.createUser("zakaznik", "zakaznik", "zakaznik@zakaznik.com", "true", "555555555", "05689", "zakaznik", "vonZakaznik", "Ricany", "U nadrazi", "6", "CUSTOMER");
    }
}
