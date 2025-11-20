package com.luxuryfashion.debug;

import com.luxuryfashion.repository.TaiKhoanRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class StartupAccountLogger implements CommandLineRunner {
    private final TaiKhoanRepository taiKhoanRepository;
    private static final Logger log = LoggerFactory.getLogger(StartupAccountLogger.class);
    @Override
    public void run(String... args) {
        log.info("[DEBUG-STARTUP] Dumping all accounts (dev mode - plain text passwords)");
        taiKhoanRepository.findAll().forEach(t ->
                log.info("[ACCOUNT] id={} email={} password='{}' roles={}",
                        t.getId(), t.getEmail(), t.getPassword(), t.getRoles().stream().map(r -> r.getName()).toList())
        );
    }
}

