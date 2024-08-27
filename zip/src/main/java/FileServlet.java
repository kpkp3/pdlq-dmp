import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class FileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 创建上传目录（如果不存在）
        Path uploadDir = Paths.get(getServletContext().getRealPath(UPLOAD_DIR));
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }

        // 获取上传的文件
        Part filePart = request.getPart("file");
        if (filePart != null && filePart.getSubmittedFileName().endsWith(".zip")) {


            // 将上传的文件保存到临时文件
            InputStream tempFile = filePart.getInputStream();


            // 解压缩文件
            try (ZipInputStream zipInputStream = new ZipInputStream(tempFile)) {
                ZipEntry entry;
                while ((entry = zipInputStream.getNextEntry()) != null) {
                    Path entryPath = uploadDir.resolve(entry.getName());

                    if (entry.isDirectory()) {
                        // 如果是目录，创建目录
                        Files.createDirectories(entryPath);
                    } else {
                        // 如果是文件，创建文件
                        try (InputStream entryInput = zipInputStream) {
                            Files.createDirectories(entryPath.getParent());
                            Files.copy(entryInput, entryPath);
                        }
                    }
                    zipInputStream.closeEntry();
                }
            }catch (IOException e) {
                e.printStackTrace();
            }
            response.sendRedirect("file.jsp");
        } else {
            response.getWriter().print("请上传一个 ZIP 文件");
        }
    }
}
