package boundary_of_law.Controllers;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.imageio.ImageIO;

import java.io.InputStream;


import boundary_of_law.persistance.PdfFileRepository;
import boundary_of_law.models.PDFFile;

@Controller
public class PDFFileController {

	@Autowired
	private PdfFileRepository pdfFileRepository;

	@RequestMapping("/pdf")
	public String displayAll(ModelMap map) throws SQLException {
		List<PDFFile> pdfFile = pdfFileRepository.getAllFiles();

		map.addAttribute("pdfFile", pdfFile);// model
		return "DisplayAllPdfFile";// view
	}

	// Create
	@PostMapping("/upload")
	public String uploadFile(@RequestParam("file") MultipartFile file) {
		try {
			PDFFile pdfFile = new PDFFile();
			pdfFile.setName(file.getOriginalFilename());
			pdfFile.setContent(file.getBytes());
			pdfFileRepository.saveFile(pdfFile);

		} catch (IOException | SQLException e) {
			System.out.println("error" + e);
			;
		}
		return "redirect:/pdf";
	}

	// Read
	@GetMapping("/download/{id}")
	public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
		try {
			PDFFile pdfFile = pdfFileRepository.getFile(id);
			if (pdfFile != null) {
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(org.springframework.http.MediaType.APPLICATION_PDF);
				headers.setContentDispositionFormData("attachment", pdfFile.getName());
				return new ResponseEntity<>(pdfFile.getContent(), headers, HttpStatus.OK);
			} else {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
			}
		} catch (SQLException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	//Edit(update)
	@GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable Long id, Model model) {
		try {
			PDFFile pdfFile = pdfFileRepository.getFile(id);
			model.addAttribute("pdfFile", pdfFile);
			return "editfile";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "File not found");
			return "editfile";
		}
	}

	@PostMapping("/update/{id}")
	public String updateFile(@PathVariable Long id, @RequestParam("file") MultipartFile file) {
		try {
			PDFFile pdfFile = new PDFFile();
			pdfFile.setId(id);
			pdfFile.setName(file.getOriginalFilename());
			pdfFile.setContent(file.getBytes());
			pdfFileRepository.updateFile(pdfFile);
		} catch (Exception e) {
			System.out.println("Update Error " + e);
		}
		return "redirect:/pdf";
	}

	// Delete
	@GetMapping("/delete/{id}")
	public String deleteFile(@PathVariable Long id) {
		try {
			pdfFileRepository.deleteFile(id);
		} catch (Exception e) {
			System.out.println("Delete Error " + e);
		}
		return "redirect:/pdf";
	}

    @GetMapping("/view/{id}")
    public String viewFile(@PathVariable Long id, Model model) throws IOException {
        try {
            PDFFile pdfFile = pdfFileRepository.getFile(id);
            if (pdfFile != null) {
                List<String> imageUrls = convertPDFToImages(pdfFile.getContent(), id);
                model.addAttribute("pdfFile", pdfFile);
                model.addAttribute("imageUrls", imageUrls);
                return "viewFile";
            } else {
                model.addAttribute("errorMessage", "File not found");
                return "error";
            }
        } catch (SQLException e) {
            model.addAttribute("errorMessage", "Internal server error");
            return "error";
        }
    }
    
    private List<String> convertPDFToImages(byte[] pdfContent, Long id) throws IOException {
        List<String> imageUrls = new ArrayList<>();
        try (InputStream inputStream = new ByteArrayInputStream(pdfContent);
             PDDocument document = PDDocument.load(inputStream)) {
            PDFRenderer pdfRenderer = new PDFRenderer(document);
            for (int page = 0; page < document.getNumberOfPages(); page++) {
                BufferedImage bim = pdfRenderer.renderImageWithDPI(page, 300);
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                ImageIO.write(bim, "png", outputStream);
                byte[] imageBytes = outputStream.toByteArray();
                imageUrls.add("data:image/png;base64," + Base64.getEncoder().encodeToString(imageBytes));
            }
        }
        return imageUrls;
    }

}
