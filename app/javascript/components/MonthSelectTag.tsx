import * as React from 'react';

type MonthSelectTagProps = {
  monthValue: string,
  monthValues: string[],
  handleChange: (value: string) => void,
};

export const MonthSelectTag: React.FC<MonthSelectTagProps> = ({ monthValue, monthValues, handleChange }) => {
  return (
    <select value={monthValue} onChange={(e) => handleChange(e.target.value)}>
      {monthValues.map((monthValue) => {
        return (
          <option key={monthValue} value={monthValue}>{monthValue}</option>
        );
      })}
    </select>
  );
};
