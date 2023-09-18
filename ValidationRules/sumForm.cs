using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace wpfKozhuhov.ValidationRules
{
    public class sumForm : ValidationRule
    {
        public override ValidationResult Validate(object value, System.Globalization.CultureInfo cultureInfo)
        {
            string num = string.Empty;
            int val;
            if (value != null)
            {
                num = value.ToString();
            }
            else
                return new ValidationResult(false, "Сумма не задана! ");
            if (!Int32.TryParse(num, out val) && num!=",")
            {
                return new ValidationResult(true, "Ошибка");
            }
            else
            {
                return new ValidationResult(false, "Сумма должна содержать цифры и (,) запятые \n " +
                    "Шаблон адруса: 3500,50");
            }
        }
    }
}
