package com.example.myservice;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.ws.rs.QueryParam;

public interface GreetingController {
    @RequestMapping("/greeting")
    String greeting();

    @RequestMapping(path = "/foo", method = RequestMethod.GET, name = "/foo")
    String foo(@QueryParam("delay") Integer delay,
               @QueryParam("size") Integer size,
               @QueryParam("resp") String resp
    );

    @RequestMapping(path = "/bar", method = RequestMethod.POST, name = "/bar")
    String postBar(@QueryParam("delay") Integer delay,
                   @RequestBody() String payload,
                   @QueryParam("resp") String resp
    );
}
