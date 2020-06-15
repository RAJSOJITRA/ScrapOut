package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Address_VO;
import com.example.demo.model.Categories_VO;
import com.example.demo.model.LoginVO;
import com.example.demo.model.OrderInfo;
import com.example.demo.model.PickupScrapInfo;
import com.example.demo.model.SignupVO;
import com.example.demo.service.AdderessService;
import com.example.demo.service.CategoriesService;
import com.example.demo.service.LoginService;
import com.example.demo.service.OrderInfoService;
import com.example.demo.service.PickupScrapInfoService;
import com.example.demo.service.SignUpService;
import com.example.demo.service.UserPrincipal;

@Controller
public class CategoriesController {

	@Autowired
	@Lazy
	private CategoriesService categoriesService;
	
	@Autowired
	@Lazy
	private SignUpService registerService;
	
	@Autowired
	@Lazy
	private LoginService loginService;
	
	@Autowired
	@Lazy
	private AdderessService adderessService;
	
	@Autowired
	@Lazy
	private OrderInfoService orderInfoService;
	
	@Autowired
	@Lazy
	private PickupScrapInfoService pickupScrapInfoService;
	
	@RequestMapping(value="/userinfo", method = RequestMethod.GET)
	  public List<SignupVO> UserInfo() {
	     UserPrincipal user = (UserPrincipal)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	     List<LoginVO> userInformation = new ArrayList<LoginVO>();
	     userInformation=this.loginService.findByUserName(user.getUsername());
	     
	     List<SignupVO> userInfo = new ArrayList<SignupVO>();
	     userInfo = this.registerService.findByUserNameandMobileNo(userInformation.get(0));
	      return userInfo;
	  }
	
	@RequestMapping(value = "/Categories_List", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Categories_List(@ModelAttribute Address_VO address_VO) {
		List<Categories_VO> categoriesList = new ArrayList<Categories_VO>();
		categoriesList=this.categoriesService.Display_Item();
		return new ModelAndView("items/Catogeries_List").addObject("categoriesList",categoriesList);	
	}
	
	@RequestMapping(value = "/scrapCls", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView Calculator(@ModelAttribute Address_VO address_VO) {
		List<Categories_VO> categoriesList = new ArrayList<Categories_VO>();
		categoriesList=this.categoriesService.Display_Item();
		return new ModelAndView("Dashboard/scrapCalculator").addObject("categoriesList",categoriesList);	
	}
	
	@RequestMapping(value = "/displayitems", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView DisplaySelectedCategoris(@ModelAttribute Categories_VO fetch_data,@RequestParam("seitems") String[] set_of_id,@RequestParam("array") String[] bundle_of_value) {
		int total =0;
		String display_string=null;
		String id_path[] = null;
		String	id_name[]=null;
		
		//list of selected items
		List <String>display_line =new ArrayList<String>();
		for(int i=0;i<set_of_id.length;i++)
		{
			id_path=set_of_id[i].split(",");    //id_path as  categeries_id from categoriesdb
			
			id_name=bundle_of_value[i].split(",");   //id_name as weight of junkproduct  respectevely categories id 
			
				for(int j=0;j<id_path.length;j++){
					fetch_data.setId(Integer.parseInt(id_path[j]));
					List l=this.categoriesService.Selected_Item_Display(fetch_data);
					fetch_data = (Categories_VO) l.get(0);
					int find_total=fetch_data.getCategories_price()*Integer.parseInt(id_name[j]);
					
					display_string ="<tr><td>"+fetch_data.getCategories_name()+"</td><td>"+fetch_data.getCategories_price()+"</td><td>"+id_name[j]+"</td><td>"+find_total+"</td></tr>";
					
					display_line.add(display_string);
					total =total +find_total;
				}
			
		}//start for loop
		
		return new ModelAndView("items/Display").addObject("total_price",total).addObject("display_string",display_line).addObject("item_id", id_path).addObject("number_of_item", id_name);	
	}
	
	@RequestMapping(value = "/AllDisplay", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<SignupVO> Allitems() {
		List<SignupVO> InfoList = new ArrayList<SignupVO>();
		InfoList=this.UserInfo();
		//System.out.println(InfoList);
		//return new ModelAndView("items/RequestPickUpNow").addObject("InfoList",InfoList);
		return InfoList;
	}
	
	
	@RequestMapping(value = "/OrderConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public void orderconfirm(@ModelAttribute Categories_VO fetch_data,@RequestParam("seitems") String[] set_of_id,@RequestParam("array") String[] bundle_of_value,@RequestParam("address") String address) {
		
		int total =0;
		String display_string=null;
		String id_path[] = null;
		String	id_name[]=null;
		
		System.out.println("seitems :"+set_of_id);
		System.out.println("weight value :"+bundle_of_value);
		
		
		List<String> itemlist = new ArrayList<String>();
		List<String> weightlist = new ArrayList<String>();
		//list of selected items
		List <String>display_line =new ArrayList<String>();
		for(int i=0;i<set_of_id.length;i++)
		{
			id_path=set_of_id[i].split(",");    //id_path as  categeries_id from categoriesdb
			
			id_name=bundle_of_value[i].split(",");   //id_name as weight of junkproduct  respectevely categories id 
			
				for(int j=0;j<id_path.length;j++){
					fetch_data.setId(Integer.parseInt(id_path[j]));
					List l=this.categoriesService.Selected_Item_Display(fetch_data);
					fetch_data = (Categories_VO) l.get(0);
					int find_total=fetch_data.getCategories_price()*Integer.parseInt(id_name[j]);
					
					itemlist.add(id_path[j]);
					weightlist.add(id_name[j]);
					
					display_string ="<tr><td>"+fetch_data.getCategories_name()+"</td><td>"+fetch_data.getCategories_price()+"</td><td>"+id_name[j]+"</td><td>"+find_total+"</td></tr>";
					
					display_line.add(display_string);
					total =total +find_total;
				}
			
		}
		//to split the id of address getting from RequestPickUpNow Ex: address,2
		String[] arrSplit = address.split(",");
		
		//geting the address
		List<Address_VO> addList = new ArrayList<Address_VO>();
		addList=this.adderessService.findById(Integer.parseInt(arrSplit[1]));
		
		//geting the user information
		List<SignupVO> InfoList = new ArrayList<SignupVO>();
		InfoList=this.Allitems(); 
		
		System.out.println("itemlist :"+itemlist);
		System.out.println("weightlist :"+weightlist);
		
		System.out.println("Order Confirm");
		System.out.println(InfoList);
		System.out.println("total: "+total);
		System.out.println("display Line: "+display_line);
		System.out.println("address: "+addList);
		
		OrderInfo o1=new OrderInfo();
		o1.setUserid(InfoList.get(0));
		o1.setAddressid(addList.get(0));
		this.orderInfoService.insert(o1);
		
		List<OrderInfo> currorder = new ArrayList<OrderInfo>();
		currorder=this.orderInfoService.findByOrderId(o1);
		
		//to store the category id and weights
		for(int i=0;i<itemlist.size();i++)
		{
			PickupScrapInfo p1=new PickupScrapInfo();
			Categories_VO c1=new Categories_VO();
			c1.setId(Integer.parseInt(itemlist.get(i)));
			
			p1.setCategoryId(c1);
			p1.setOrderid(o1);
			p1.setWeights(Integer.parseInt(weightlist.get(i)));
			
			//storing the weights and category id
			this.pickupScrapInfoService.insert(p1);
		}
		
	}
	
}
