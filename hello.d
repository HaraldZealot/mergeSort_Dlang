module main;

import std.stdio;

void mergeSort(alias compare, T)(T[] array)
{
    mergeSortImpl!(compare)(array, 0, array.length);
}

void mergeSortImpl(alias compare, T)(T[] array, int left, int right)
{
    if (left<right-1)
    {
        auto middle=(right+left)/2;

        mergeSortImpl!(compare)(array, left, middle);
        mergeSortImpl!(compare)(array, middle, right);

        auto leftPart=array[left..middle].dup;

        auto rightPart=array[middle..right].dup;

        int i=left, j, k;

        while (j<leftPart.length && k<rightPart.length)

            if (compare(leftPart[j], rightPart[k]))
                array[i++]=leftPart[j++];
            else
                array[i++]=rightPart[k++];

        foreach(e; leftPart[j..leftPart.length])
          array[i++]=e;

        foreach(e; rightPart[k..rightPart.length])
          array[i++]=e;
    }
}

void main()
{
    string[] array=["Hello", "Bye", "What", "Deal", "Huge"];

    writeln(array);

    mergeSort!((arg1, arg2){return arg1>=arg2;})(array);

	writeln(array);
}
