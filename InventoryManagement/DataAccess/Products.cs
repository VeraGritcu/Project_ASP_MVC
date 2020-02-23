using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DataAccess
{
    public class Products
    {
        public int Id { get; set; }

        [Required]
        [DisplayName("Nume")]
        public string Name { get; set; }

        [DisplayName("Descriere")]
        public string Description { get; set; }

        [Required]
        [DisplayName("Pret")]
        public decimal Price { get; set; }

        [Required]
        [DisplayName("Unitate")]
        public string Unit { get; set; }

        [Required]
        [DisplayName("Categorie")]
        public Category Category { get; set; }
    }
}