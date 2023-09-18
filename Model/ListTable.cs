using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Collections.ObjectModel;

namespace wpfKozhuhov.Model
{
    public class ListTable : ObservableCollection<Table>
    {
        public ListTable()
        {
            DbSet<Table> tables = PageSecurities.DataEntitiesSecuritie.Tables;
            var queryTable = from table in tables select table;
            foreach (Table tabl in queryTable)
            {
                this.Add(tabl);
            }
        }
    }
}
