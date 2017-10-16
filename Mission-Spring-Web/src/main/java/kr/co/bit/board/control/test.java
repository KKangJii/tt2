package kr.co.bit.board.control;

public class test {
	public static void main(String[] args) {
		int x=6,i;
		int a[] = new int[x];
		for (i = 1; i < x; i++) {
			a[i] = a[i-1] + i;			
		}
		System.out.printf("%d", a[i-1]);
	}
}
