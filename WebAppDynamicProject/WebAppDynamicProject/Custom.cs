using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace WebAppDynamicProject
{
    public class Custom
    {
    }

    [MetadataType(typeof(CityMetadata))]
    public partial class City { 
    
    }

    public class CityMetadata {
        [DisplayName("City")]
        public object City1 { get; set; }
    }


    [MetadataType(typeof(CountryMetadata))]
    public partial class Country
    {

    }

    public class CountryMetadata
    {
        [DisplayName("Country")]
        public object Country1 { get; set; }
    }


    [MetadataType(typeof(PostOfficeMetadata))]
    public partial class PostOffice
    {

    }

    public class PostOfficeMetadata
    {
        [DisplayName("Post Office")]
        public object PostOffice1 { get; set; }
    }


    [MetadataType(typeof(RentalMetadata))]
    public partial class Rental
    {

    }

    public class RentalMetadata
    {
        [DisplayName("Monthly Rent")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:f2}")]
        public object MonthlyRent { get; set; }

        [DisplayName("Advance Amount")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:f2}")]
        public object AdvanceAmount { get; set; }


        [DisplayName("Start Date")]
        [DisplayFormat(ApplyFormatInEditMode = true,
               DataFormatString = "{0:MM/dd/yyyy}")]
        public object StartDate { get; set; }

        [DisplayName("End Date")]
        [DisplayFormat(ApplyFormatInEditMode = true,
               DataFormatString = "{0:MM/dd/yyyy}")]
        public object EndDate { get; set; }

        [DisplayName("Entry Date")]
        [DisplayFormat(ApplyFormatInEditMode = true,
               DataFormatString = "{0:MM/dd/yyyy}")]
        public object EntryDate { get; set; }
        
    }

    [MetadataType(typeof(ReceiptMetadata))]
    public partial class Receipt
    {

    }

    public class ReceiptMetadata
    {
        

        [DisplayName("Amount")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:f2}")]
        public object Amount { get; set; }


        [DisplayName("Received Date")]
        [DisplayFormat(ApplyFormatInEditMode = true,
               DataFormatString = "{0:MM/dd/yyyy}")]
        public object ReceivedDate { get; set; }

        //[DisplayName("End Date")]
        //[DisplayFormat(ApplyFormatInEditMode = true,
        //       DataFormatString = "{0:MM/dd/yyyy}")]
        //public object EndDate { get; set; }

        //[DisplayName("Entry Date")]
        //[DisplayFormat(ApplyFormatInEditMode = true,
        //       DataFormatString = "{0:MM/dd/yyyy}")]
        //public object EntryDate { get; set; }

    }

    [MetadataType(typeof(RequestMetadata))]
    public partial class Request
    {

    }

    public class RequestMetadata
    {
        [DisplayName("Request Date")]
        [DisplayFormat(ApplyFormatInEditMode = true,
               DataFormatString = "{0:MM/dd/yyyy}")]
        public object RequestDate { get; set; }
    }

    [MetadataType(typeof(HouseMetadata))]
    public partial class House
    {
        public override string ToString()
        {
            return string.Format("{0}",this.HouseNo);
        }
    }

    public class HouseMetadata
    {
        [DisplayName("Monthly Rent")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:f2}")]
        public object Rent { get; set; }
    }


    [MetadataType(typeof(ClientMetadata))]
    public partial class Client
    {
        public override string ToString()
        {
            return string.Format("{0} {1}", this.FirstName, this.LastName);
        }
    }

    public class ClientMetadata
    {
        //[DisplayName("Request Date")]
        //[DisplayFormat(ApplyFormatInEditMode = true,
        //       DataFormatString = "{0:MM/dd/yyyy}")]
        //public object RequestDate { get; set; }
    }

    public partial class Owner
    {
        public override string ToString()
        {
            return string.Format("{0} {1}", this.FirstName, this.LastName);
        }
    }

    public partial class Agent
    {
        public override string ToString()
        {
            return string.Format("{0} {1}", this.FirstName, this.LastName);
        }
    }





}
