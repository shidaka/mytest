package com.example.myservice;

import com.netflix.discovery.EurekaClient;
import com.netflix.discovery.shared.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Vector;
import java.util.concurrent.Future;

@SpringBootApplication
@RestController
public class MyserviceApplication implements GreetingController {

	@Autowired
	@Lazy
	private EurekaClient eurekaClient;

	@Value("${spring.application.name}")
	private String appName;

	public static void main(String[] args) {
		SpringApplication.run(MyserviceApplication.class, args);
	}

	@Override
	public String greeting() {
		Application app = eurekaClient.getApplication(appName);
		String clientAppName = "NONE";
		if (app != null) clientAppName = app.getName();
		return String.format(
				"appName: %s Hello from '%s'!", appName, clientAppName);
	}

	final static String str = "01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

	@Override
	public String foo(Integer delay, Integer size, String resp) {
		int wait = delay == null ? 0 : delay;
		int loadSize = size == null ? 0 : size;
		String res;
		int strSize = str.length();

		StringBuilder b = new StringBuilder();
		while (b.length() < loadSize)
		{
			if (loadSize - b.length() >= strSize)
				b.append(str);
			else {
				int chunk = loadSize - b.length();
				b.append(str.substring(0, chunk));
			}
		}

		try {
			if (wait > 0) Thread.sleep(wait);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		res = loadSize > 0
				? b.toString()
				: resp == null ? "Ok" : resp;

		return res;
	}

	@Override
	public String postBar(Integer delay, String payload, String resp) {
		int wait = delay == null ? 0 : delay;
		String res = resp == null ? "Ok" : resp;

		try {
			if (wait > 0) Thread.sleep(wait);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		return res;
	}

}
