package podcast.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan("podcast")
public class WebAppMvcConfig implements WebMvcConfigurer  {
	
	// viewResolver setPrefix setSuffix
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(2);
		System.out.println("test1");
		return viewResolver;
	}

	// virtual path setting
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//addResourceHandler("虛擬路徑").addResourceLocations("真實路徑")
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
		System.out.println("test2");
	}
	
	//multipart resolver
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		System.out.println("test3");
		return multipartResolver;
	}
	
	
	//json:print clean format
	@Bean
	public MappingJackson2JsonView jsonView() {
		MappingJackson2JsonView mappingJackson2JsonView=new MappingJackson2JsonView();
		mappingJackson2JsonView.setPrettyPrint(true);
		System.out.println("json clean print");
		return mappingJackson2JsonView;
		
	}
	
	//json:scan all bean can be json
	@Bean
	public Jaxb2Marshaller jxb2Marshaller() {
		Jaxb2Marshaller jaxb2Marshaller=new Jaxb2Marshaller();
		jaxb2Marshaller.setPackagesToScan("podcast");
		System.out.println("json scan podcast");
		return jaxb2Marshaller;
	}
	
	//json:scan all bean can be json
	@Bean
	public ContentNegotiatingViewResolver contentNegotiatingViewResolver() {
		ContentNegotiatingViewResolver contentNegotiatingViewResolver=new ContentNegotiatingViewResolver();
		List<View> defaultViews = new ArrayList<View>();
		defaultViews.add(jsonView());
		contentNegotiatingViewResolver.setDefaultViews(defaultViews);
		System.out.println("json viewer format add");
		return contentNegotiatingViewResolver;
	}
	

	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		System.out.println("test4");
    	configurer.enable();
    }
}
