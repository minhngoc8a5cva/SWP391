package controller;


import model.Product;
import model.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("single-product.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Product> allProducts = dao.getAllProducts();
        String filter = request.getParameter("filter");

        int pageNumber = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageParam);
        }
        int pageSize = 6;
        List<Product> productsOnPage;
        if (filter == null) {
            productsOnPage = paginate(allProducts, pageNumber, pageSize);
            request.setAttribute("products", productsOnPage);
            request.setAttribute("allProducts", allProducts);

            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else {
            List<Product> filteredProducts = null;
            if (filter.equalsIgnoreCase("all")) {
                productsOnPage = paginate(allProducts, pageNumber, pageSize);
            } else {
                filteredProducts = filterProductsByCategory(allProducts, filter);
                productsOnPage = paginate(filteredProducts, pageNumber, pageSize);
            }
//            int totalFilteredProducts = filter.equalsIgnoreCase("all") ? allProducts.size() : filteredProducts.size();
//            ObjectMapper mapper = new ObjectMapper();
//            ObjectNode jsonResponse = mapper.createObjectNode();
//            jsonResponse.put("productsOnPage", mapper.valueToTree(productsOnPage));
//            jsonResponse.put("totalFilteredProducts", totalFilteredProducts);
//
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResponse.toString());
    }

    }

    private List<Product> filterProductsByCategory(List<Product> allProducts, String category) {
        if (category.equals("all") || category.isEmpty()) {
            return allProducts;
        }
        List<Product> filteredProducts = new ArrayList<>();
        for (Product product : allProducts) {
            if (product.getCname().equalsIgnoreCase(category)) {
                filteredProducts.add(product);
            }
        }
        return filteredProducts;
    }

    private List<Product> paginate(List<Product> products, int pageNumber, int pageSize) {
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, products.size());
        if (startIndex >= endIndex) {
            return Collections.emptyList();
        }
        return products.subList(startIndex, endIndex);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
