using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Google.GData.Calendar;
using Google.GData.Client;
using Google.GData.Extensions;

namespace GESAC
{
    public class GCalendar
    {
        private string CalendarURI = System.Configuration.ConfigurationManager.AppSettings["URI"];
        private string Correo = System.Configuration.ConfigurationManager.AppSettings["correo"];
        private string Contraseña = System.Configuration.ConfigurationManager.AppSettings["contraseña"];
        
        public void addEvent(string lugar, DateTime inicio, double duracion, string asunto, string contenido, IList<Participantes> participantes)
        {
            Where location = new Where() { ValueString = lugar };
            Reminder reminder = new Reminder() { Hours = 1, Method = Reminder.ReminderMethod.email };
            When time = new When(inicio, inicio.AddHours(duracion));
            time.Reminders.Add(reminder);

            CalendarService service = new CalendarService("GESAC");
            service.setUserCredentials(Correo, Contraseña);

            EventEntry entry = new EventEntry();
            entry.Title.Text = asunto;
            entry.Content.Content = contenido;
            entry.Notifications = true;
            entry.Locations.Add(location);
            entry.Times.Add(time);

            foreach (Participantes p in participantes)
            {
                entry.Participants.Add(new Who() { ValueString = p.Nombre, Email = p.Correo, Rel = "nofollow" });
            }

            AtomEntry insert = service.Insert(CalendarURI, entry);
        }
    }
}