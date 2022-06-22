namespace System
{
    internal class Windows
    {
        internal class Forms
        {
            internal class Label
            {
            }

            internal class TextBox
            {
                public string Text { get; internal set; }

                internal void ResetText()
                {
                    throw new NotImplementedException();
                }
            }

            internal class Button
            {
            }

            internal class Panel
            {
            }
        }
    }
}