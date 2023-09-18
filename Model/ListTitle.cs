using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Collections.ObjectModel;

namespace wpfKozhuhov.Model
{
    public class ListTitle : ObservableCollection<Title>
    {
        public ListTitle()
        {
            DbSet<Title> titles = PageEmployee.DataEntitiesEmployee.Titles;
            var queryTitle = from title in titles select title;
            foreach (Title titl in queryTitle)
            {
                this.Add(titl);
            }
        }
    }
}
