import * as React from 'react';
import { Bar } from 'react-chartjs-2';

const { memo } = React;

export type DataType = {
  labels: string[];
  datasets: {
      label: string;
      data: number[];
      backgroundColor: string;
  }[];
};

type BarGraphProps = {
  data: DataType,
};

export const BarGraph: React.FC<BarGraphProps> = memo(({ data }) => {
  return (
    <Bar
      data={data}
    />
  );
})
