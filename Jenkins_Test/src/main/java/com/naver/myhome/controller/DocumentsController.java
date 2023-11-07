package com.naver.myhome.controller;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Documents;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.DocumentsService;

@Controller
@RequestMapping(value = "/documents")
public class DocumentsController {
    private static final Logger logger= LoggerFactory.getLogger(DocumentsController.class);
    
    private DocumentsService documentsService;
    
    @Value("${file.upload.path}")
	private String saveFolder;
    
    @Autowired
    public DocumentsController(DocumentsService documentsService) {
        this.documentsService = documentsService;
    }
    
    @RequestMapping(value = "/documents-list", method = RequestMethod.GET)
    public ModelAndView documentslist(@AuthenticationPrincipal User user , ModelAndView mv, HttpSession session) {
    	int projectId = (int) session.getAttribute("projectId");
        mv.setViewName("documents/documents-list");
        return mv;
    }
    
    @ResponseBody
    @RequestMapping(value = "/search-documents-list", method = RequestMethod.POST)
    public List<Documents> searchDocumentList(@AuthenticationPrincipal User user , String keyword) {
    	Documents inputDocument = new Documents();
    	
    	inputDocument.setUserId(user.getId());
    	
    	if(keyword != "") {
    		inputDocument.setKeyword(keyword);
    	}
    	
        List<Documents> documents = documentsService.getAllDocuments(inputDocument);
        
        for(int i = 0 ; i < documents.size() ; i++) {
        	documents.get(i).setFileSize(documents.get(i).getFileSize() / 1024);
        }
        return documents;
    }
    
    @ResponseBody
    @GetMapping("/down")
    public byte[] DocumentsFileDown(@RequestParam String saveName,
            HttpServletRequest request,
            @RequestParam String originalName,
            HttpServletResponse response) throws Exception{

        String decodedSaveName = java.net.URLDecoder.decode(saveName, StandardCharsets.UTF_8);
        String sFilePath = saveFolder + decodedSaveName;

        File file = new File(sFilePath);

        byte[] bytes = FileCopyUtils.copyToByteArray(file);

        String sEncoding = new String(originalName.getBytes("utf-8"), "ISO-8859-1");

        response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding);

        response.setContentLength(bytes.length);
        return bytes;
    }
}


