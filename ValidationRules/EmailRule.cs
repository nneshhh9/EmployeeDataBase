using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace wpfKozhuhov.ValidationRules
{
    public class EmailRule : ValidationRule
    {
        public override ValidationResult Validate(object value, System.Globalization.CultureInfo cultureInfo)
        {
            string email = string.Empty;
            if (value != null)
            {
                email = value.ToString();
            }
            else
                return new ValidationResult(false, "Адрес электронной почты не задын! ");
            if (email.Contains("@") && email.Contains("."))
            {
                return new ValidationResult(true, null);
            }
            else
            {
                return new ValidationResult(false, "Адрес электронной почты должен содержать символ @ и (.) тички \n " +
                    "Шаблон адруса: anrey@mail.ru");
            }
        }
    }
}
