package iuh.vn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class CaoThiHongMaiApplication {

	public static void main(String[] args) {
		SpringApplication.run(CaoThiHongMaiApplication.class, args);
	}

}
