import streamlit as st
import altair as alt
import pandas as pd
import numpy as np

st.header("st.write")

st.write("hello, *world* :sunglasses:")

st.write(1234)

df = pd.DataFrame({
    "first col": [1,2,3,4],
    "second col": [10, 20, 30, 40]
})
st.write(df)

st.write('Below is a DataFrame:', df, 'Above is a dataframe.')

df2 = pd.DataFrame(
     np.random.randn(200, 3),
     columns=['a', 'b', 'c'])
c = alt.Chart(df2).mark_circle().encode(
     x='a', y='b', size='c', color='c', tooltip=['a', 'b', 'c'])
st.write(c)