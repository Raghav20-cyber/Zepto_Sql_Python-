import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

engine = create_engine("mysql+pymysql://root:password@localhost:3306/startersql")


query = "SELECT * FROM zepto"
df = pd.read_sql(query, engine)

#print(df.head())

# Revenue per category
df['revenue'] = df['discountedSellingPrice'] * df['availableQuantity']

category_revenue = df.groupby('Category')['revenue'].sum()

print(category_revenue)

# Price per gram
df['price_per_gram'] = df['discountedSellingPrice'] / df['weightInGms']
print(df[['Category', 'price_per_gram']].drop_duplicates().head())

# Plotting revenue
plt.figure(figsize=(10, 6))
category_revenue.plot(kind='bar')
plt.title('Revenue per Category')
plt.xlabel('Category')
plt.ylabel('Revenue')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('revenue_per_category.png')
plt.show()







