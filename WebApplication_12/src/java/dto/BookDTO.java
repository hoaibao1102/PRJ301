/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author MSI PC
 */
public class BookDTO {
    private String bookID;
    private String bookTitle;
    private String bookAuthor;
    private int publishYear;
    private double price;
    private int quantity ;

    public BookDTO() {
        this.bookID = "";
        this.bookTitle = "";
        this.bookAuthor = "";
        this.publishYear = 0;
        this.price = 0;
        this.quantity = 0;
    }

    public BookDTO(String bookID, String bookTitle, String bookAuthor, int publishYear, double price, int quantity) {
        this.bookID = bookID;
        this.bookTitle = bookTitle;
        this.bookAuthor = bookAuthor;
        this.publishYear = publishYear;
        this.price = price;
        this.quantity = quantity;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "BookDTO{" + "bookID=" + bookID + ", bookTitle=" + bookTitle + ", bookAuthor=" + bookAuthor + ", publishYear=" + publishYear + ", price=" + price + ", quantity=" + quantity + '}';
    }
    
    
}
